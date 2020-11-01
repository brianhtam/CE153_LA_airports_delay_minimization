# A Forced Market Optimization of Los Angeles Area Airport Delays

## Project Team

**Brian Tam, Jerry Chen, Jules Pommies, John Stuart, and Jack Wegleitner**

Table of Contents

**[Abstract](#_gkkg4dwfqdw1) 2**

**[Introduction](#_togulez0804i) 3**

**[Background](#_nhjy1y2vbeeu) 5**

[Opportunities to Improve](#_2tjm3rmbe8vf) 5

[Traveling to the LA airports](#_6f5hex3vnjn7) 6

[Airport Layouts](#_du5l6lx6rj83) 8

[Wind Conditions](#_9ssaug5d8oum) 9

[The Problem with Delays](#_1hlh1c4e6rj5) 10

[Los Angeles International Airport](#_yixlszdfessl) 11

[The 4 Other Los Angeles Area Airports](#_vx2b7k375yda) 13

**[Problem Statement and General Theories](#_xjiyx1ejdxuq) 15**

**[Data Sources and Initial Analysis](#_wn1d3t6enh51) 16**

[General Method and Data Sources](#_lulqnfi0djtc) 16

[Initial Data Analysis](#_e2vjs8s0gwm3) 18

**[Research and Simulation Methodology](#_gjcyj0n29ljg) 23**

[Existing Scheduling System](#_bhpgic1ls9l6) 23

[Approach](#_e603a1g73k51) 23

[MILP](#_m5sqo4eeoedg) 24

[Assumptions/Project Limitations](#_ve7gbhq6u8xi) 26

[Results](#_lrbodr5rgb6b) 27

[Issues and Improvements](#_me9tjmksc4r5) 29

[Dynamic Programming](#_a42v44udk1jr) 30

[Computational Conclusions](#_eaafp0dis5km) 30

**[Landside Analysis](#_3ltc4o9m8b8o) 32**

[LAX Data and Surveys](#_5rds01k1p0dc) 32

[Traffic Analysis](#_zez5fhal0vzv) 34

[Best Airport Solutions](#_z3e0ukt5llwn) 35

[Landside Conclusion](#_bsku0qdalcxw) 37

**[Compensation Theories](#_mxnzktjssqjf) 39**

**[Concluding Remarks and Recommendations](#_cgx0x76uu833) 41**

**[Works Cited](#_opq4ykre2igz) 43**

**[Appendix](#_w2lbfrvmp9hw) 44**

## Abstract

This study aims to look at how air traffic in the LA basin can be optimized to reduce delays and therefore carbon emissions. To ensure a thorough result could be provided by the end of the semester, a lot of background research on existing conditions and necessary constraints was done before work on the optimization program began. The information learned in the early stages drove the constraint relaxation while developing the optimization program.

From there the project focused on investigating and experimenting with different optimization techniques to demonstrate the merits of developing scheduling software that uses individual flight data to produce a delay-minimizing schedule and assess its impact on the air transportation industry of Los Angeles. Due to the shear volume of data, the optimization was ran over an hour long window of time per day and the results can be aggregated across the day. Factors such as planes needing to leave the same airport they departed and passenger transfers were relaxed in this study.

Research was also done on landside transportation of passengers to the five LA basin airports, knowing that a redistribution of flights would require incentives. Using the Google Maps API and the 2015 LAX passenger survey, travel time to each airport from every zip code in LA County was calculated. Visualizations of the data were created to help combine the results with the larger study of the LA basin.

Overall the study proves that the air traffic can be optimized to reduce delays in the LA basin. This does come at the steep cost of changing the status quo. Due to deregulation there is no governing body that can enforce a forced market at this point in time. Airlines and passengers are used to the system as it is, so changing would be met with resistance. The end of the study discusses various incentives and methods to go about implementing an optimized solution.

##


##


## Introduction

The airspace sitting directly over Southern California represents one of the busiest airspace sectors in the whole world. In recent years, the Southern California Terminal Radar Approach Control (SoCal TRACON) has maintained its rank as the busiest TRACON in the United States, handling well over 2 million flights per year through airspace that covers around 10,000 square miles. The majority of these flights handled are transitioning in or out of the 5 Los Angeles area airports that serve the busy Los Angeles Basin area.

Los Angeles International Airport in particular is well known for air traffic delays. Causes of delay are mostly caused by traffic congestion on the ground. The horseshoe terminal complex network only allows for one aircraft in each alley at a time, meaning that arriving aircraft attempting to enter a gate must first wait for any aircraft already pushed back to clear the alley first. The airport also has restrictions regarding the operation of and around large, heavy aircraft. Additionally, LAX is in a state of constant construction and renovation, which results in taxiway and runway closures that can clog aircraft flow on the ground.

The frequent delays at LAX, combined with inconvenient ground transportation to/from the airport and complex terminal layout have caused some travelers to avoid traveling through LAX. There are many other airports located in the Greater Los Angeles Area, including John Wayne Orange County/Santa Ana (SNA), Long Beach (LGB), Ontario (ONT), and Burbank (BUR). These airports tend to experience less delays; however, the airports operate fewer flights per day and also operate to fewer nonstop destinations. In terms of runway and gate capacity, the neighboring airports are much farther from reaching full traffic capacity.

This research project aims to explore the consequences of regulating and redistributing commercial air traffic entering and departing these 5 Los Angeles area airports. If domestic traffic is reduced at LAX and instead sent to the 4 other airports, congestion and delays could be reduced at LAX. At the same time, it would reduce aircraft carbon emissions resulting from time spent in delay.

The intentional manipulation of routes and frequency of air service significantly contrasts with the existing free airline market system, where, generally speaking, airlines are under few restrictions as to where they may fly, what times of day they fly, and how frequent they fly.

Introducing regulations in terms of these airline freedoms is likely to increase the overall cost of air travel. These costs include monetary losses from airlines, increased ground transportation costs, increased overall travel time, and loss of convenience for the traveler. As such, it is important to consider what level of compensation society must receive if such a plan were to be effected.

## Background

## **Opportunities to Improve**

Our focus is on the five major airports in the LA basin. Although LAX is heavily congested, the other four airports have a miniscule number of yearly passengers in comparison, suggesting that there is opportunity for improvement through redistribution of flights.

![](RackMultipart20201101-4-dd57dc_html_4ddb0be4a8f3ed95.png)

_Comparison of Airport Statistics_

All major airports under the Federal Aviation Administration update their capacity profiles to display their estimated current capacity and plot their actual traffic counts. Two of the five airports we look at fall under this database: Long Beach and LAX. While the curve for LAX displays a heavily congested profile, Long Beach&#39;s profile shows that their airport is way below capacity, with a facility reported rate well under the estimated rate.

![](RackMultipart20201101-4-dd57dc_html_48e38ed28a74f09a.png)

_[6] Long Beach Airport capacity curve [7] LAX capacity curve_

## **Traveling to the LA airports**

In order to gain a better understanding of these locations, our team made an attempt to visit the 5 major airports that were located in the LA Basin. On November 11th, one of our team members flew down to John Wayne Airport and then on November 13th flew back up through Long Beach Airport.

![](RackMultipart20201101-4-dd57dc_html_45c4ba24972cf2e1.png)_Pictures we took of the respective airports._

Several things we found were interesting in our Long Beach Airport visit. First off was the structure of this airport in comparison to LAX. The size of Long Beach was tiny in comparison, having a much narrower security checkpoint and consist of two separate buildings for passenger waiting areas. The ceiling within these buildings were approximately twenty feet in height, which contributes to the overall feeling of spaciousness even though the airport was small. Traveling between links, most of the journey was actually outdoors. The link between the security check in and passenger waiting areas are exposed outdoors. Long Beach doesn&#39;t have any gateways, instead passengers walk outside on the apron, and board the plane through stairs.

![](RackMultipart20201101-4-dd57dc_html_e081878635a71921.png) ![](RackMultipart20201101-4-dd57dc_html_279d59c0bc275b56.png)

_Raised ceiling in waiting area Passengers boarding aircraft_

On the return journey, our team noticed that there were two separate flights from Long Beach Airport to Oakland International Airport departing at exactly the same time. The flights were essential identical, only different because of conflicting airlines, making us wonder if a more optimal flight could&#39;ve been created if the two flights were combined to one, using forced market that we propose.

Our project focuses on redistributing flights from LAX to more optimal airports within its relative proximity. Even though Long Beach is small, it is not as congested when compared to LAX. Our team&#39;s visits to these two airports confirmed the facts we read online gave us a better understanding on the situations within these airports. ![](RackMultipart20201101-4-dd57dc_html_169938fcbdd96e39.png)

## **Airport Layouts**![](RackMultipart20201101-4-dd57dc_html_75d711be090f8a1f.png)

![](RackMultipart20201101-4-dd57dc_html_caecb8a4c0732ac9.gif)

_Figure 5: Airport map of LAX_

Los Angeles International Airport (LAX) is one of the busiest airports in the United States with 74,937,004 yearly passengers in 2015. It has four, runways oriented at 24-6. Two are arrival runways and two are departure runways. The network of taxiways can support most aircraft. For heavier aircraft, such as the Airbus A380, only certain taxiways may be utilized due to safety concerns. This can add to the taxi traffic. LAX&#39;s terminal layout is a multi-unit pier-finger concept for its 121 gates. While some terminals are connected past the security checkpoint, others are isolated units. The multi-unit terminal concept allows individual airlines to take part in financing terminal upgrades to their needs. The tightly spaced pier-fingers also create traffic in the gate area. Careful coordination of planes is necessary when taxiing to or from gates. ![](RackMultipart20201101-4-dd57dc_html_f1bfeb259a01b4a2.png)

![](RackMultipart20201101-4-dd57dc_html_543b9649299b328c.gif)

_Figure 6: Airport map of BUR_

The Burbank Bob Hope Airport (BUR) serves as a regional airport for northern LA County. It processed 3,943,629 passengers in 2015. It has two runway oriented at 15-33 and 8-26 which are 5,800&#39; and 6,800&#39; respectively. This restricts the type of aircraft that can operate out of BUR. It has a total of 14 gates in a linear and curve-linear arrangement. Per the FAA safety standards, the current terminal is too close to the existing runways and a new terminal will be built to replace the current one in the future. ![](RackMultipart20201101-4-dd57dc_html_b72a8ca5cf564b6.png)

![](RackMultipart20201101-4-dd57dc_html_2a4d16c8d61a1c95.gif)

_Figure 7: Airport map of SNA_

The Santa Ana/ John Wayne airport (SNA) serves the Orange County area as a regional airport. It handled 10,180,258 passengers in 2015 and is equipped with one large runway oriented 19-1. There are 26 gates at SNA all contained within the same building. The terminal layout style is linear which allows for an easy flow of airplane traffic around the gate area. SNA also operates on strict noise abatement restrictions. ![](RackMultipart20201101-4-dd57dc_html_13a132f739ae5ab1.png)

![](RackMultipart20201101-4-dd57dc_html_543b9649299b328c.gif)

_Figure 8: Airport map of ONT_

Ontario International Airport (ONT) is the eastern most airport in the LA Basin and the most removed from the other 4 airports. Annually, it serves 4,209,311passengers from its 26 gates. The terminal buildings are multiple units and linear which creates a lot of room for airplane traffic while taxing. ONT&#39;s two runways are both over 10,000&#39;. The airport is the primary air shipping hub for UPS in Southern California because of these runways and the low passenger volume. ONT was a member of Los Angeles World Airports (LAWA) from 1985 until November 1, 2016 when it was returned to the city of Ontario. This membership is speculated to have has some effect on the amount of passenger traffic ONT normally receives. ![](RackMultipart20201101-4-dd57dc_html_84abcbf6defb5fd6.png)

![](RackMultipart20201101-4-dd57dc_html_543b9649299b328c.gif)

_Figure 9: Airport map of LGB_

Long Beach Airport (LGB) is a regional airport for the city of Long Beach. It served 2,523,686 in 2015 out of 11 gates. The terminal layout is a single linear building where passengers board their planes via stair tower on the tarmac. There are 5 runways at the airport. Two short north-south runways, two medium length east west runways and a 10,000&#39; runway oriented 12-30. This allows for a wide variety in the aircraft fleet servicing LGB but creates a more complex system of taxiways. Similar to SNA, noise abatement policies are strictly enforced at LGB.

## **Wind Conditions**

For LAX there are two takeoff runways with a greater than 4300 ft separation that can operate independently. Wind vortices around the airport create distinct departure and arrival streams the aircraft have to follow. These wind vortices create a set of constraints that we had to incorporate into our code when calculating the optimal redistribution of aircraft. ![](RackMultipart20201101-4-dd57dc_html_8d2fc931f27dd2d4.png)

_LAX approach and departure paths for its two different wind conditions._

## **The Problem with Delays**

The motivation for studying ways to improve air traffic efficiency at LAX stems from the flight delays that LAX is notoriously known for. LAX consistently ranks in newspapers as among the worst airports in the nation to fly through. While many would agree that delays are unpleasant, most people do not understand the full scope of how flight delays affect the entire air transportation system or just how costly they are. The most obvious effect of flight delays is the inconvenience for the traveler, along with any additional monetary costs associated with changing his/her travel plans as well as the psychological costs associated with delays. Perhaps also fairly obvious are the monetary costs to airlines, which include the extra spending for crew and staff, extra fuel and other operational and equipment costs, and costs associated with re-booking and handling of affected passengers. For the additional time that equipment is running, there is a greater carbon footprint and more noise pollution. Less obvious are the costs to the entire air transportation industry. For examples, a delayed flight may cause pilots and flight attendants to time out on their schedule and become legally incapable of further operating an aircraft. Airport curfews may force a simple flight delay to become cancelled instead of late. Connecting flights operated by other airlines in other parts of the country and world will be affected by the need to accommodate late passengers onto new flights. Lastly, air traffic controllers must assign new slots in aircraft schedules, and under busy schedules this can affect other on-time flights&#39; schedules. Given the multitude of ways in how air traffic delays adversely affect air travel, it is easy to see why we are very interested in reducing such delays.

## **Los Angeles International Airport**

While dozens of airports in the United States suffer from chronic flight delays and cancellations, LAX poses a unique challenge due to its close proximity with neighboring residential areas, relatively small ground surface area, combination of international, long- and medium- range domestic, and short-range feeder flights, and heavy mix of origin-destination and transferring traffic. LAX has one of the highest aircraft-on-ground densities among all airports in the world. At the same time, simple expansion of the airport is nearly impossible due to very close neighboring communities, businesses, and environmental reserve areas. Thus, simple airport expansion, which would have solved overcrowding and ground congestion at many other airports, cannot be applied so freely to solving delays at LAX.

Unsurprisingly, LAX experiences its worst delays during the morning and late afternoon rush periods. From traffic data collected for all domestic flights through LAX on October 10 2016, we saw that ground taxi delays for arriving aircraft were usually lower than those for departing aircraft. Since LAX&#39;s daily domestic flight schedule remains roughly the same each day of the week, the following graphic is fairly representative of typical flight delays each day at LAX:

![](RackMultipart20201101-4-dd57dc_html_bb254454e58b3a4b.jpg)

_Figure 1. The taxi-out delays experienced by all domestic commercial flights departing from LAX on October 10, 2016. Each diamond represents one flight. The red line represents the mean taxi-out delay experienced by all domestic departing flights within one hour of the represented point._

![](RackMultipart20201101-4-dd57dc_html_7d0a00921e2c878a.jpg)

_Figure 2. The taxi-in delays experienced by all domestic commercial flights arriving to LAX on October 10, 2016. Each diamond represents one flight. The blue line represents the mean taxi-in delay experienced by all domestic arriving flights within one hour of the represented point._

Combining Figures 1 and 2 and comparing the taxi in and taxi out delays we can easily see that the average inbound delay is usually significantly lower than the average outbound delay:

![](RackMultipart20201101-4-dd57dc_html_409aceadaaf8722e.jpg)

_Figure 3. Combined taxi-out and taxi-in delays for domestic flights at LAX, October 10, 2016_

## **The 4 Other Los Angeles Area Airports**

Perhaps what little relief it offers to travelers is the existence of nearby commercial airports located around the Los Angeles basin. Long Beach airport is to the southeast of LAX, and John Wayne Santa Ana airport is further south from Long Beach. Burbank airport is to the northeast, farther north than Downtown Los Angeles. Ontario airport sits slightly farther to the east.

![](RackMultipart20201101-4-dd57dc_html_f17e544953d9a62.png)

_Figure 4. Location of the 5 Los Angeles Area Airports_

Limited commercial airline service exists at these airports. International service exists to only about 3 destinations outside the United States, while most domestic destinations are located in the southwestern and western United States with a few exceptions further east. In recent years these 4 airports have seen a general rise in airline traffic. Some recent events include Southwest Airlines&#39; introduction of service into Long Beach, as well as JetBlue&#39;s expansion out its existing hub at Long Beach. This goes to show that not only is passenger demand at these airports increasing, but also that these airports have the ability to accommodate such growth.

Unfortunately, there are two hurdles that exist that significantly limit the expansion of service at these airports. The first of these is runway lengths. John Wayne airport and Burbank airport do not have very long runways and can generally only accommodate small and medium passenger jets. While Long Beach airport has a fairly long runway, operational restrictions effectively limit the size of aircraft that may use the runway at all. Ontario airport is the only airport with a very long runway, which in fact is used regularly by large cargo freighters. The expansion of service to these airports is likely to be limited to smaller jets that serve short- and medium-haul markets. The second of these restrictions is noise curfews and noise restrictions. With the exception of Ontario, these airports all include regulations aimed at reducing noise. The most restrictive of these is arguably John Wayne airport, which not only includes a stringent noise abatement departure procedure but also has limitations on the allowed frequency of departures as well as a nighttime curfew. Burbank and Long Beach both also have noise abatement procedures, as well as a nighttime curfew for certain types of especially noise aircraft. Ontario airport does not have any explicit noise restrictions or special rules concerning noise.

The combination of short runways and noise restrictions can make it difficult to try to expand service into these airports using larger aircraft. Smaller passenger jets, up to aircraft as large as the Boeing 757 and Airbus A321, are able to fly to these airports. The largest passenger jets that regularly serve the Los Angeles area airports tend to be Boeing 737s and Airbus A320s. This of course is with the exception of Ontario airport, which regularly sees UPS Boeing 747 freighters operate in and out of their cargo facility.

##


##


## Problem Statement and General Theories

LAX suffers from severe air traffic delays which significantly detract from the efficiency of airline travel and overall traveller experiences. Airline delays are a major source of traveler inconvenience and introduces significant emotional stresses. Due to a variety of challenges that make it difficult to solve the delay problem using simple airport expansion, we introduce a revolutionary approach to improving the air transportation system of the entire Los Angeles Area.

The core research theory that this project examines is that, _by_ _reducing air traffic_ _at LAX, we could reduce congestion_. The surplus demand for air service through the Los Angeles area will be handled by redirecting the flights through the other 4 LA Area airports. Therefore, the overall traffic going in and out of the Los Angeles _area_ remains the same, but this traffic through each airport is different as a result of redistribution.

The theory requires one key assumption: that every passenger must, given an appropriate level of incentives, be willing to fly out of a different airport than the one that is preferred. In other words, the study ignores the existence of passengers who refuse to fly out of any other airport than their preferred choice regardless of what kind of compensation is offered. This assumption is fairly realistic because currently, there are already a significant number of passengers flying in and out of LAX who live closer to one of the other 4 area airports. Furthermore, there are also many travelers who are willing to pay slightly more airfare to fly out of another nearby airport for the smoother travel experience. Most travelers value time and convenience when it comes to planning trips and as such, tend to place less emphasis over the airport selection.

On a more practical note it is important to realize that ground congestion at LAX is not necessarily as extreme as it tends to sound. From Figure 1 we can see that departing flights tend to experience longer delays from about 6AM-9AM and also from about 5PM-8PM. For arriving flights, peaks are barely noticeable. Therefore, the restrictions on flights need not apply for all 24 hours of a day; rather, they can be applicable to only the very congested time periods of the day.

## Data Sources and Initial Analysis

## **General Method and Data Sources**

To conduct the study, the Aviation System Performance Metrics (ASPM) database was used. This database provides a wealth of information on individual flights arriving or departing from a chosen airport. The data utilized in this study included the carrier; scheduled gate, taxi and flight times; actual gate, taxi and flight times; and any delay. After hearing the project proposal and meeting with the team. Professor Rakas allowed us to use the database for the study. One member was given the password in order to prevent widespread use of the database. After taking an initial look at the data, a better understanding of the extent to which each airport operates was gained.

![](RackMultipart20201101-4-dd57dc_html_4f2214a950c6c2ed.png)

_Figure_ _10 __: Flow__ -__Chart of the research method used_

The information from the ASPM database was used in a few ways when researching a more optimized flight distribution in the LA basin. To begin, the data is passed through a MATLAB script to clean it up and convert all necessary data to numbers. Taxi delays are then plotted for major airlines to give the user a visualization of the data. Using this information, windows of time are chosen to better optimize. Air delay times are then pulled from the dataset within the determined window of time and fed into the optimization program. The results then drive the suggested redistribution of flights.

Of course this shuffling of flights greatly affects the passengers flying at the given time so a closer look was taken at the landside as well. Data from Los Angeles International Airport 2015 Air Passenger Survey Results and Findings provided fantastic information on travel origins or destinations for passengers traveling through LAX. Pairing this information with Google Maps API, landside travel patterns were analyzed to determine the ideal airport from which to travel for each zip code in LA County. This information was also considered in the final suggestions.

## **Initial Data Analysis**

Taxi delay data from the five largest domestic airlines was plotted initially to provide a better understanding of the existing system. It was then determined what timeslots to optimized from these charts. In addition, the following figures help to drive the final results.

American Airlines has regular service to every airport in the region as seen in figure X below. The majority of their LA operations are based out of LAX which is their 8th largest hub in the United States. At LAX there are a large amount of delays for both arrivals and departures while at other airports taxi delays are only due to departures, implying the wait is caused by factors at the flight&#39;s destination.

![](RackMultipart20201101-4-dd57dc_html_2607cde3ec2b4dd0.gif)

_Figure 11: Taxi in and out delays for American Airlines on October 16__th_ _at the 5 LA basin Airports_

 ![](RackMultipart20201101-4-dd57dc_html_b200fc0431361148.png) ![](RackMultipart20201101-4-dd57dc_html_ed406fb1e95c8b2a.png)

Beginning in 2016, Southwest Airlines serviced all five commercial airports in the LA basin. They serve mainly as a regional airline. While LAX is their eighth busiest airport, they experience relatively low taxi delays there along with the rest of the LA basin airports. Part of this could be due to their terminal one position at the end of the north runways. Overall, Southwest services the five LA airports in a consistent manner with regard to delays.

![](RackMultipart20201101-4-dd57dc_html_aa73bd6d5635c3c3.png)

![](RackMultipart20201101-4-dd57dc_html_2607cde3ec2b4dd0.gif)

_Figure 12: Taxi in and out delays for Southwest on October 16__th_ _at the 5 LA basin Airports_

 ![](RackMultipart20201101-4-dd57dc_html_fd0d7a996a50d6b5.png)

United Airlines also operates heavily out of LAX in the LA basin with LAX being its seventh largest hub in the United States. The airline also serves BUR, ONT, and SNA but with less frequency than American Airlines. United falls victim to high delays in taxi time at LAX. While this may be the case, using LAX as a hub benefits United because of the international market that is served by LAX.

![](RackMultipart20201101-4-dd57dc_html_436437d2997873b5.png)

![](RackMultipart20201101-4-dd57dc_html_2607cde3ec2b4dd0.gif)

_Figure 13: Taxi in and out delays for United Airlines on October 16__th_ _at the 5 LA basin Airports_

 ![](RackMultipart20201101-4-dd57dc_html_e5ac7ec31d5cf932.png)

Delta Airlines, similar to United and American, uses LAX heavily in the LA basin despite it not being one of their hub airports. The airline used Sea-Tac as its main Asian gateway. While their performance in delays at BUR, LGB, ONT, and SNA is trivial, Delta is also marred by taxi delays when operating out of LAX. This could be due to the placement of the American, Delta, and United terminals all next to each other at LAX.

![](RackMultipart20201101-4-dd57dc_html_45e6dce6e0eec957.png)

![](RackMultipart20201101-4-dd57dc_html_2607cde3ec2b4dd0.gif)

_Figure 14: Taxi in and out delays for Delta on October 16__th_ _at the 5 LA basin Airports_

 ![](RackMultipart20201101-4-dd57dc_html_ec5e9da8fe492ada.png)

Jet Blue is the sixth largest airline in the United States behind the previous four airlines and Air Canada. Currently they only operate at BUR, LAX, and LGB within the LA basin. Their delay trend is similar to Southwest&#39;s delay trend at similar airports which suggests that possibly expanding their LA basin operations to other regional airports would not have an effect on their taxi delay times .

![](RackMultipart20201101-4-dd57dc_html_64918f00a8e79e28.png)

![](RackMultipart20201101-4-dd57dc_html_2607cde3ec2b4dd0.gif)

_Figure 15: Taxi in and out delays for Jet Blue on October 16__th_ _at the 5 LA basin Airports_

 ![](RackMultipart20201101-4-dd57dc_html_a4468721cab5cf6.png)

##


## Research and Simulation Methodology

## **Existing Scheduling System**

Currently, due to the Airline Deregulation act of 1978, the scheduling of flights is determined by market forces, airline decisions, and airport-determined rules for how slots can and cannot be used. In this system, airports offer slots to airlines, which set a maximum on airline service and may be bounded by number of flights or number of passengers. IATA&#39;s Worldwide Slot Guidelines (WSG) also play a guiding role in determination of an airport&#39;s slot policy [5].

In this framework, slots are distributed to airlines according to legal procedures and expected demand for each airline, and the airlines then schedule their flights in accordance with those allocations. Because of this, large and high capacity airlines are incentivized, making market entry for smaller airlines difficult. Generally, slots dictate how many gates are available as well so that slot policy, coupled with gate leases, makes for a very calcified and profit focused market at large airports such as LAX. Furthermore, since both airlines and airports are competitors, there is often little to no communication between parties, leading to a schedule that may be optimal for each entity, but is not efficient globally, leading to conflicts and delays.

Though this practice leads to an inefficient and highly profit driven policy under the current paradigm, slots can be as restrictive as they need to be. This means airport slot policy could be a possible area of improvement or regulation to implement a more delay optimized schedule.

## **Approach**

To approach a problem such as this with its high potential for political and economic impacts throughout the air traffic industry, our group determined that the primary issue in developing effective regulation was the information gap it would have to overcome. The decisions of passengers, airlines, and airports are influenced by a plethora of factors. Thus, to determine a schedule that could reduce delays, as much data as possible should be taken into account to accurately predict the effects of making such changes and avoid regulation inefficiencies due to a lack of information.

To address this problem, our project focuses on investigating and experimenting with different optimization techniques to demonstrate the merits of developing scheduling software that uses individual flight data to produce a delay-minimizing schedule and assess its impact on the air transportation industry of Los Angeles. Research into this topic throughout the semester yielded two promising methods: Mixed Integer Linear Programming (or MILP for short) and Dynamic Programming. Both have been used by previous work in the field of air traffic scheduling and can be applied to optimize a variety of factors [3] [2]. Computational methods are also widely used by the FAA to assist air traffic controllers, such as in the case of the Center TRACON Automation System (CTAS) used to schedule aircraft and maintain safe spacing [1]. Our problem expands upon this work with the added complexity of scheduling between multiple airports as options and minimizes delays whereas others focus on maximizing aircraft separation.

## **MILP**

At their core, MILPs are simply linear programs that utilize branch and bound to derive integer solutions and often apply the Big M Method to transform logical disjunctions into constraints that can be analyzed by a linear solver. Its benefits include its relative ease of implementation and flexibility in making changes or improvements later since the whole program depends mainly on changes to the constraint matrices. However, early results showed that MILPs of this variety are inherently time intensive, as its number of constraints and variables can easily balloon into the millions with less than a single day of arrivals to schedule.

Because of this, a set of assumptions had to be proposed and validated to make the problem feasible and the scope of the project had to be scaled back from arrivals and departures to just arrivals. Even with these assumptions though, the MILP suffers from an unpredictable time complexity that becomes infeasibly long in scenarios with difficult to locate optimums. Despite these flaws, the MILP remained the simplest to change and experiment with, and was selected as our method of choice to go ahead with further refinements.

Air traffic, with its many regulations and technical constraints, requires a properly posed problem to accurately represent real conditions. The below figure shows a summary of the problem&#39;s components and how they were represented mathematically. Initially the problem was designed with the capability of determining the amount of holds and route delay that would be required to achieve an optimal distribution, providing further guidance for air traffic control decisions, but this added layer of detail was determined superfluous and a drain on resources. It was kept, but disabled to improve run time.

The other critical factors modeled by this problem are a delay limit to prevent any one aircraft from being forced to endure excessive delays and the objective function, which defines delay as the difference between scheduled arrival time and the earliest possible time that aircraft could arrive with an unimpeded approach.

![](RackMultipart20201101-4-dd57dc_html_e0e161375027a405.png)

| MILP Problem Formulation |
| --- |

In MATLAB, the following four steps detail the process for solving this problem given our available data.

1. Individual flight data is extracted from ASPM database[4]
2. Aircraft equipment ID and other databases are used to determine: ➤ weight category ➤ fuel consumption
➤ point of origin ➤ original destination,
➤ separation requirements ➤ time impacts of changing destination
3. For loops assemble the constraint arrays A, B, Aeq, and beq from the data calculated in Step 2
4. _Intlinprog_ function uses the simplex algorithm and branch and bound to explore options and find a delay minimizing schedule

## **Assumptions/Project Limitations**

The MILP makes a number of permissible assumptions about aircraft dynamics and regulations to enable faster computation. These assumptions include:

- Schedules repeat over the course of days or weeks.
- 7 Runways for arrivals (2 each at LAX and LGB).
- Aircraft arrive from 4 general directions, meaning additional flight time to each airport varies.
- Once at an airport, all aircraft merge into a single approach path

It also has a number of temporarily relaxed constraints. These were relaxed either to improve runtime or because of issues in finding, importing, and converting other data types to useable numeric data that could be read by a linear algebra solver. These relaxed constraints include:

- Runway capabilities (based on weight class)
- Variable headway requirements (an average of 90 seconds used)
- Actual vs random origin direction

Beyond physical constraints, optimality conditions must also be taken into account, and tolerances on solutions and variables can be relaxed to improve time complexity in some large sample size scenarios.

**Bivariate Constraint Selection**

Despite the ability to choose average values for some factors, the permissible scheduling window time proved particularly difficult to determine. This time is defined as the time between the first earliest possible arrival time and the last earliest possible arrival time plus an acceptable delay of X minutes. To determine X, we created another program (LongTermPlot.m) to iterate the scheduler with different values of x as well as different numbers of available runways to schedule on and plot the results. As the following figure shows, a larger number of runways available to schedule over (Active Airports) greatly reduces delays. Delay window (Last Delay Limit (X)) is slightly more complicated in that if it is too short the problem is infeasible, which also varies depending on the active airports.

![](RackMultipart20201101-4-dd57dc_html_3b8df8036c6a650a.png)

![](RackMultipart20201101-4-dd57dc_html_808a289aacb67b59.gif)

[Top] Cumulative and average delay of scheduling a small sample of aircraft under varying constraints.

[Left] 2D plot of delay versus active airports and delay limits. Shaded area represents the constraint combinations where an optimal solution is always possible.

 ![](RackMultipart20201101-4-dd57dc_html_e42f41a6a2b9edaf.png)

## **Results**

When operating under ideal conditions, the program can feasibly analyze an interval spanning approximately 45-60 minutes. When these intervals are ran successively, a representation of a peak hour schedule can be developed and a cumulative delay can be produced. This schedule is then represented by a bar chart comparing the original routing of the analyzed aircraft (Status Quo) to the optimized schedule.

The results show that current traffic is primarily focused at LAX, but it also shows that an optimized schedule should distribute flights more evenly as hypothesized. This however does not account for their differences in capacity, only in expected delays and geographic separation. Because of this, there is a clear indication that the program is biased towards airports on the periphery of the Los Angeles Basin because they minimize air time and land the aircraft as fast as possible. While this option does avoid air traffic, it does not reflect the fact that landing further from the destination of most passengers will almost always increase their overall carbon footprint by forcing them to use more ground transportation, which is less efficient that air transportation. Capacity constraints and a different system for weighting the priority of airports could be implemented to solve this given additional time.

Every iteration generates a plot of runway decisions and a complete schedule vector. Originally sample sizes were too small to produce meaningful results. Most results would be either infeasible or have zero delay. Proper selection of a scheduling window, which was accomplished via LongTermPlot.m, solves this problem.

Our program generated a large number of theoretical schedules, all with similar trends. To summarize, two representative examples are shown below. On the left is the largest sample size attempted by our program. On the right is an earlier attempt from a much smaller sample size of aircraft. Their similarity shows how the schedules generated in smaller sample sizes can accurately be extrapolated to larger ones, allowing us to make assumptions about the ~1200 arrivals that occur throughout the day by looking at smaller subsets.

![](RackMultipart20201101-4-dd57dc_html_f14f99f0730b2591.gif) ![](RackMultipart20201101-4-dd57dc_html_8f2134966906d4db.png) ![](RackMultipart20201101-4-dd57dc_html_47f26b613c13573a.png)

- 200 flights
- 5.5 minutes of delay total
- 7 minute excess scheduling window
- 5 iterations of 40 A/C, starting at 9:00,
 the typical beginning of peak hour.

| Final Results of largest sample size executed | Early results of small sample size |
| --- | --- |

## **Issues and Improvements**

Future improvements upon this program should be in two areas. One is reactivation of certain constraints that were deemed too computationally intensive or too difficult to enter data for. An example of a data entry problem is the issue of categorizing every possible airport of origin and translating its IATA airport code to its approach direction. The other major area is the reduction of time complexity. As our work has shown, accurate representation of real conditions and time complexity must be carefully balanced to produce any useable results.

Another possible area of improvement is the inclusion of heuristic search, wherein the program will only assess the nodes that minimize the sum of the best solution yet found and the probable delay of changing to a given runway. This way the function will have to search fewer nodes if, for example, it would only assess the function where a flight is redirected to an uncongested airport rather than checking it at all airports.

From the perspective of producing a feasible regulatory strategy, additional data would be needed. As the presentation judging panel pointed out, airlines could greatly increase their efficiency if they consolidated to a single airport, since each airport they have a presence at would require its own minimum amount of staff to operate. Differentiating between international and domestic flights would also be a valuable improvement since it would allow large, hubbing international flights to be directed primarily to LAX while smaller flights could be directed elsewhere due to the high proportions of passengers with Los Angeles as their final destination. Furthermore, comprehensive passenger data on the percent of passengers expecting to transfer would also be needed since spreading them all out would make hubbing inherently impossible in some cases. Such passenger destination data could solve the issue by only allowing the program to change routes with few expected transferring passengers, since they would be prime candidates with few impacts on the traveler experience. Additionally, providing people movers between airports could further change the scenario by allowing passengers to land at one airport and easily transfer at another. However, this would also be an exceedingly large infrastructure project and would require further study.

## **Dynamic Programming**

The other approach our team attempted was the creation of a dynamic program scheduler. This however, was met with a long string of technical difficulties in the code due to the much more complicated nature of dynamic programs, and thus the MILP was selected as the most effective option for our project and the best vehicle for further experimentation and improvement. We do however recommend further research into the use of dynamic programming in scheduling, since with more time and resources, it promises to be a more time efficient algorithm that is guaranteed to find a solution without getting bogged down. It is also a prime candidate for the addition of heuristic methods to reduce its time complexity further, making it likely the most efficient option our team is aware of for this problem.

## **Computational Conclusions**

As an air traffic software design project, our primary results are a suggested methodology for flight scheduling and the output of our experimental program. The results of our program, though limited, yielded some indication of potential delay reductions. It shows that an MILP optimized schedule can reduce delays from 2.35 minutes (average air delay across the entire ASPM data set sampled) to 0.89 minutes over all final cases analyzed. Experimentation across different scheduling windows and runway options graphically showed that having more runways to schedule over drastically reduces delays and that 7 active runways does in fact have the potential of reducing delays to zero. This also depends on how long a timeframe these aircraft may be scheduled in. Furthermore, the runway decision mix of our experimental program indicates that aircraft should in fact be spread out across all airports but should give priority to smaller periphery airports (SNA, BUR, and ONT) to minimize interaction with LA airspace to reduce possible conflicts with other approaches.

For any future research or development of scheduling software, we recommend either using either a MILP run iteratively over several smaller sample sizes or a dynamic program for execution on a larger sample size of aircraft, especially when paired with a heuristic search aspect. Both approaches have their merits, but the majority of our efforts went into investigating the MILP option. Thus, we recommend the following guidelines and factors to account for in future development:

1. Divide aircraft into smaller groups to reduce time complexity and sum the cumulative delays and runway decisions over each successive group.
2. Establish optimality criteria that produce consistent solutions without causing excessively long runtime.
3. Providing a realistic fleet mix (in terms of weight, point of origin, and separation requirements) will improve optimization speed by making some options clearly better than others, leading to faster and more accurate convergence to a solution.
4. Any arbitrary constraints (i.e. constraints not determined by geography, physical limitations, or the FAA) that are up to the discretion of the scheduler should be determined experimentally to find a value that is optimal and always feasible.

## Landside Analysis

In order to reduce the total delay for every passenger we can not only focus on the airside. For obvious reasons landing in LAX or in ONT can be two very different solutions for one passenger and the only main decision-making argument can be in the land-side travel-time or access to the airport. Moving a flight to a different airport also means imposing a new land-destination for all the passengers of this very flight. So even if rerouting this flight will reduce delay by a certain amount of minutes it does not guarantee a shorter journey from door to door for all the passengers. This is why we decided to analyse what such rerouting will mean for the landside and how it will impact the passengers.

## **LAX Data and Surveys**

To know how all the passengers of LAX are currently travelling to or from LAX we used the _Los Angeles International Airport 2015 Air Passenger Survey Results and Findings_ and more specifically the Transportation part of it. In this report every passenger was asked how did they get to the airport and/or how will they get out of it. In addition most of them have given their home Zip code in the Los angeles area. Those were the main data used to estimate the main mean of transportation used to get to LAX.

First of all we analysed the ground access modes (Figure

#
**X** ).

![](RackMultipart20201101-4-dd57dc_html_d2610db072bd3f33.png)

_Figure X: Ground access mode split_

88.4% of the passengers use private transportation and most of the 11% left only use shared shuttle from hotels or private transportation companies. Almost 48% of the passengers use their private car. It is clear that private transportation and road access is the main and deciding mode. This is why our analysis will only focus on that specific access mode.

Another important point for our analysis was the origin of all the passengers. The idea was to find out where most of the passenger come from and so to find the most convenient airport for them. Once again we used the data from the LAX passenger survey and we created a map representing the amount of passenger in every Zip code area in the Los Angeles County which represent almost 85% of all the passengers in LAX. As you can see on Figure 1, most of the passengers come from Beverly Hills, Santa Monica, LA Downtown or Longbeach. But otherwises there is no distinction between the other area and almost all of the county is represented which means a lot of the passenger could benefit from a flight in one of the other local airports.

![](RackMultipart20201101-4-dd57dc_html_95c4d350b4c94832.png)

Figure 1: Percentage of LAX passengers in Zip code areas

## **Traffic Analysis**

Given that the roads are the main way to access the airport, we decided to look at the roads network around every airport. Accessibility, traffic and efficiency were the dominating factors that we looked for. We mainly used the Google Maps API to get the traffic and travel time information

![](RackMultipart20201101-4-dd57dc_html_b9d8927837fc5b5a.png)

LAX : It is served by two major freeways in the Los Angeles area, the I-405 and the I-105. But it is on average almost always highly congested and reductions are very frequent.

![](RackMultipart20201101-4-dd57dc_html_c09c2643aef8d307.png)

ONT : It is served by two major freeways in the Los Angeles area, the I-15 and the I-10. But it is on average almost always highly congested and reductions are very frequent.

![](RackMultipart20201101-4-dd57dc_html_6bb27874a1f744c3.png)

LGB : It is served by two major freeways in the Los Angeles area, the I-405 and the I-605 which is a little further away on the East. This airport is the less congested of the five but congestions are still frequent.

![](RackMultipart20201101-4-dd57dc_html_85f9af3dcbedf92e.png)

SNA: It is served by three major freeways in the Los Angeles area, the I-405 the I-73 and the I-55. For this airport too there are lots of congestions and speed reductions for the average traffic status.

![](RackMultipart20201101-4-dd57dc_html_69f5ea2a1019ae32.png)

BUR : It is served by two major freeways in the Los Angeles area, the I-5 and the I-134. But it is on average also highly congested and reductions are frequent.

Those results are not surprising because a wider analysis of the general traffic in the Los Angeles freeways traffic shows that almost every part of the network is congested. There is not a single road where there is no speed reduction. So we need to look at every airport and see what part of the county it deserves the best, based on the average traffic on the network.

## **Best Airport Solutions**

We assumed that if all the other parameters are the same for one flight, the only parameter left for one passenger to make a choice for what airport to pick, is the travel time to go there. And so we based our analysis on the time to get from home to one airport. This time will give a good estimate of the cost for one passenger to select this airport, the goal is to take into account the distance and the mean traffic in order to get an estimate. Of course the reality is more complex and decision changes for the passenger will impact the traffic and modify the equilibrium, but this is a first order approach to get an idea of the benefit we can get from our rerouting system.

For every airport we computed a map showing the mean travel to get to that specific airport. Those maps are only a way to represent the expected time, and therefore cost, for a passenger to go to one airport.

![](RackMultipart20201101-4-dd57dc_html_b21bd0e2e46924a2.png) ![](RackMultipart20201101-4-dd57dc_html_d12d9b6be6879674.png) ![](RackMultipart20201101-4-dd57dc_html_a5c57a1b972483.png)

When we had the data for all the airports we produces a last map which represents the time difference for every Zip code areas between going to LAX and going to the closest airport from their home. ![](RackMultipart20201101-4-dd57dc_html_1d6bd858cb8c9cac.png)

## **Landside Conclusion**

Our landside analysis was made to get an idea of the consequences of the flight rerouting system for the passengers. The main change for them would be the travel time to the airport and so the general access to the airport. We saw that all the airports are well deserved by major freeways of the Los Angeles county. Besides they are well spread over the county and so will be able to share the demand.

After a first order analysis of the traffic and network access all across of the county and based on the passenger survey of LAX, we reached the conclusion that almost 40% of the passenger would benefit (in terms of travel time) from not going to LAX. The passengers who are concerned by such a condition lived in the red areas on the map. Passengers in the blue areas will always benefit from going to LAX.

![](RackMultipart20201101-4-dd57dc_html_ec8ac744841458d0.png)

This simple analysis shows that there is a significant part of the LAX passengers that would benefit from our rerouting system and that the landside analysis goes in this way. However it is true that the landside imposes some criterion to the rerouting system. The main one is the issue raised by connections, because moving one flight to another airport means that all the connecting passengers would now need to reach an other airport to get their connection which will obviously extend their journey.

## Compensation Theories

While our data analysis shows that the redistribution of traffic could in theory be very effective at reducing air traffic delays, the reality is that society will be very unwilling to adopt such an air service system due to the higher overall costs. As previously mentioned, such costs include lost revenue from airlines and airports, longer overall time spent in the trip, and the psychological costs associated with loss of convenience and the simple deviation from established norms.

Since the airline industry already operates as a free market, the overall costs of all industry players are already minimalized (or are always trying to be minimalized). The new traffic distribution moves away from a free market into a &quot;forced&quot; market where overall costs will be higher. Therefore, the only way, in theory, for society to accept such a new air transportation system is if each player in the air transportation industry is &quot;reimbursed&quot; for the additional costs. Such reimbursement will make the cost of air travel under the forced market the same as it was under the existing free market.

The nature of the incurred costs vary; some are in units of time, others in units of dollars, others in units of pounds of carbon dioxide, and others may not even have any assigned units at all. Nevertheless in order to come up with any type of reasonable estimate of what level of reimbursements will be required for the industry players, these costs must be normalized in a way that they can be easily comparable and evaluated.

Perhaps a more familiar term to begin with is the Value Of Time, or commonly abbreviated VOT. VOT is in units of dollars per unit time and represents the monetary value of an individual&#39;s time. VOT generally holds values approximately equal to an individual&#39;s equivalent hourly wage, and tends to be higher for wealthier individuals and lower for less wealthy individuals. It should be noted that, of all the factors determining travel experience, VOT might be the single most important element; most travelers tend to place significant emphasis on how long their travel time was compared with other aspects, such as service, etc.

From VOT we can multiply with the additional travel time for the same trip to/from the Los Angeles area to obtain a monetary figure of what amount of reimbursement will approximately be required for each traveler. It should be noted that, even for a modest estimate of a VOT of $25/hour, ground transportation times could easily reach 1 hour through the Los Angeles Basin, which will result in $25 of compensation to the traveler. For businesspeople, this value could easily be much higher, and given the significant number of travelers flying through the Los Angeles airports it is easy to see how reimbursement for even small added costs can quickly become unacceptably high.

The assessment of the other costs is determined in similar ways. Monetary losses experienced by airlines, airports, and other service providers are easy to determine since they are already in units of dollars. The psychological cost is likely the most difficult to determine as these costs are likely to vary significantly from individual to individual. This research project ignores those travelers who will refuse to accept in the new air transportation system regardless of what level of compensation are provided; this is expressed here in the form of individuals who claim their psychological cost is infinitely high. Nevertheless, the difficulty of assessing individual psychological costs could result in an &quot;average&quot; cost that is applied across all travelers, which will likely result in a significant number of individuals claiming the &quot;average&quot; compensation is not high enough for their individual cost. In other words, such travelers would simply not be happy with the new air transportation system.

It is true that through the &quot;forced market&quot; air transportation system, inherent incentives are present in the form of reduced air travel time from aircraft delays, their associated lowered operating costs, the associated reduced carbon footprint and emissions, along with the improved travel experience. While it was not possible to quantify these savings, it is unlikely that these savings could counter the costs described above.

It was computationally impossible to simulate a typical day&#39;s worth of air travel through the Los Angeles basin and produce any meaningful quantitative estimates of about how much it would cost to reimburse all the players involved in the air transportation industry.

## Concluding Remarks and Recommendations

The 5 Los Angeles Area airports represent a critical economic and social hub for travelers going through the Los Angeles Basin. Of these 5, LAX is notorious for its delays due to extremely high air traffic delays coupled with a number of challenging legal and practical obstacles. While simple expansion is not a clear applicable solution for LAX, a new option has been shown potential for improving the efficiency of airline transportation throughout the region.

Simulation results confirm that offering five airports to schedule over could greatly reduce delays by splitting aircraft into more approach streams and that our estimated number of active arrival runways in the region (7 runways estimated) is sufficient to reduce total delay to zero in some scenarios, though additional constraints must be imposed to better model reality, meaning this optimum is likely to increase with increased realism. Additionally, from a programming perspective, this type of problem is very time complex. Thus a more powerful machine, or more efficient algorithm, is required to compute and produce any sort of realistic air traffic schedule that spans such a large volume of flights. With such a schedule it will be possible to examine in more detail and accuracy the scope and extent of such a project. In any future developments, we recommend either using either MILPs, dynamic programs with heuristic elements, or investigating other more advanced algorithms not covered in the scope of this project, to generate complete, optimized, and useable schedules.

While the concept of a &quot;forced market&quot; inherently brings regulatory schemes and loss of company and customer freedom, it should be noted that such an idea need not be truly forced upon by, say, the government. Airline traffic is already growing at the 4 other major Los Angeles Area airports, suggesting that passengers themselves are already taking initiatives to take advantage of the lower air traffic delays through these airports. It may suggest that origin-destination traffic is already slowly being moved to the other nearby airports. This is purely the result of customer demand.

Should an actual, full-scale implementation of an entirely regulated air traffic schedule be required, likely the Federal Aviation Administration along with other federal governing bodies will be the first to introduce restrictions against airlines. Recognizing that LAX has a mix of origin-destination as well as transferring passengers, it is perhaps wise to focus first on the redistribution on the origin-destination flights. However, as we have seen from the current LAX traffic data, a small shift in where people decide to fly may be all that is needed for conditions to improve drastically at Los Angeles International Airport.

## Works Cited

[1] Alexandre M. Bayen, Claire J. Tomlin, et al. &quot;MILP Formulation and Polynomial Time Algorithm for an Aircraft Scheduling Problem.&quot; _IEEE Conference on Decision and Control_ n. pag. Print.

[2] Alexandre M. Bayen, Todd Callantine, et al. &quot;Optimal Arrival Traffic Spacing via Dynamic Programming.&quot; _AIAA Conference on Guidance, Navigation, and Control_ n. pag. Print.

[3] Alexandre M. Bayen, and Claire J. Tomlin. &quot;Real-Time Discrete Control Law Synthesis for Hybrid Systems Using MILP: Application to Congested Airspace.&quot; n. pag. Print.

[4] &quot;Federal Aviation Administration.&quot; N.p., n.d. Web. 23 Dec. 2016.

[5] &quot;IATA - Worldwide Airport Slots.&quot; N.p., n.d. Web. 23 Dec. 2016.

[6] Faa Airport Planning And Environmental Division (App-400);+1 (202) 267-3263. &quot;Los Angeles International.&quot; _Los Angeles International (LAX) Airport Capacity Profile, 2014_ (2014): n. pag. _Faa.gov_. Web. 24 Dec. 2016.

[7] Faa Airport Planning And Environmental Division (App-400);+1 (202) 267-3263. &quot;Long Beach International.&quot; _Long Beach-Daugherty Field (LGB) Airport Capacity Profile, 2014_ (2014): n. pag. _Faa.gov_. Web. 24 Dec. 2016.

**Links**

[1] [http://bayen.eecs.berkeley.edu/sites/default/files/conferences/MILP\_formulation.pdf](http://bayen.eecs.berkeley.edu/sites/default/files/conferences/MILP_formulation.pdf)

[2] [http://bayen.eecs.berkeley.edu/sites/default/files/conferences/gnc04.pdf](http://bayen.eecs.berkeley.edu/sites/default/files/conferences/gnc04.pdf)

[3]http://bayen.eecs.berkeley.edu/sites/default/files/conferences/real-time\_discrete\_control\_law\_synthesis.pdf

[4] [https://aspm.faa.gov/](https://aspm.faa.gov/)

[5] [http://www.iata.org/policy/infrastructure/slots/Pages/index.aspx](http://www.iata.org/policy/infrastructure/slots/Pages/index.aspx)

[6][https://www.faa.gov/airports/planning\_capacity/profiles/media/LAX-Airport-Capacity-Profile-2014.pdf](https://www.faa.gov/airports/planning_capacity/profiles/media/LAX-Airport-Capacity-Profile-2014.pdf)

[7] [https://www.faa.gov/airports/planning\_capacity/profiles/media/LGB-Airport-Capacity-Profile-Appendix-A-2014.pdf](https://www.faa.gov/airports/planning_capacity/profiles/media/LGB-Airport-Capacity-Profile-Appendix-A-2014.pdf)

## Appendix

1. MILP Scheduler (LAdelay.m)
2. Bivariate constraint plotting script/scheduler iteration mechanism (LongTermPlot)
3. Dynamic Program Scheduling outline (DynLAdelay.m)

| LAdelay.m (A) |
| --- |
| %A Forced Market Model for Delay Minimization in the LA Basin(J^4 + B)%Title: LAdelay
%Function: Minimize delays over a given time span by manipulating %destination of each aircraft (bin), as well as # of holds (int) % and construction of additional capacity (bin).%Then calculate expected cost of redirection for each airport and airline %(in terms of lost passengers/landing fees and change in fuel burn, %possibly including social cost of carbon) and determine an effective level%of incentives for implementing the optimum. (or assume airports share%profits for additional simplification i.e. LAWA annexes everything)
%Load individual flight data for given time span (peak demand hour)ARR=importdata(&#39;ARR.csv&#39;); %(flights x data types)ARRn=ARR.data;ARRt=ARR.textdata;%%DEP=importdata(&#39;DEP.csv&#39;);%DEPn=DEP.data;%DEPt=ARR.textdata;
start=322+sample\*(NG-1);N=length(ARRn(start:start+sample-1,1));R=7;Rcap=[3; %LAX1 %----additional runway analysis required----3; %LAX22; %LGB12; %LGB22; %SNA2; %ONT2]; %BURsize = ones (N,1); %create A/C size matrix%for i=1:N %find the size of the aircraft based on tail number% if or(strcmp(ARRt(i,3),[TN, TN, TN])); %must be cell array% Size(i) = 1; %heavy% elseif or(strcmp(ARRt(i,3),[TN, TN, TN]));% Size(i) = 2; %B757% elseif or(strcmp(ARRt(i,3),[TN, TN, TN]));% Size(i) = 3; %large% else% Size(i) = 4; %small% end%end
%create matrix of FAA separation regulations based on A/C sizeFAAsep=(1/3600).\*[90 120 120 120; %rows = H-\&gt;S leading in minutes90 90 90 120; %cols = H-\&gt;S following60 60 60 60;45 45 45 45];T=zeros(N,N);%create minimum headway Matrix Tfor i=1:N %create matrix of lead/follow distance relationships between each A/Cfor j=1:NT(i,j)=FAAsep(size(i),size(j));endend
%calculate expected air time assuming delays at point of origin and enroute%time are known. Total airtime represents the expected time of arrival with%acceptable delays. This program minimizes unacceptable delays in LA airpspace which is%anything beyond what the airline scheduled forte= ARRn(start:start+sample-1,18); %ARRn(start:start+sample-1,2)+ARRn(start:start+sample-1,5)./60+ARRn(start:start+sample-1,17)./60; %te=t\_gateOutActual + t\_TaxiOutActual + ATe
%ARRerr=te+(1/60)\*floor(3\*randn(length(te),1)); %Arr = data(:,1) + rand..... random error
M=1e3; % Big M
ncons=(2\*N+N\*(N-1)+R); %number of constraints
c=zeros(3\*N+N\*R+N\*(N-1)/2,1); %form cost vectornvars=length(c); % number of variablesc(1:N)=ones(1,N); % minimize sum of delayed arrival times
Tdest= (1/60).\*[5 5 10 10 15 5 0;10 10 10 10 10 0 10;10 10 5 5 0 10 15;0 0 0 0 0 10 0]; %time to each destination in minutesActDest=zeros(N,1); %initialize actual destinationOrigin = randi(4,N,1);ARRt(start:start+sample-1,:)ARRn(start:start+sample-1,:)for i = 1:N ActDest(i)= 1\*strcmp(ARRt(i+1+start,6),&#39;LAX&#39;)+3\*strcmp(ARRt(i+1+start,6),&#39;LGB&#39;)+ 5\*strcmp(ARRt(i+1+start,6),&#39;SNA&#39;)+ 6\*strcmp(ARRt(i+1+start,6),&#39;ONT&#39;)+7\*strcmp(ARRt(i+1+start,6),&#39;BUR&#39;); %determine original destination% if strcmp(ARRt(i+1+start,5),&#39;orig&#39;); %cell array of eastern origins %determine original direction of origin% Origin(i)=1; %North%elseif strcmp(ARRt(i+1+start,5),&#39;orig&#39;); %cell array % Origin(i)=2; %East%elseif strcmp(ARRt(i+1+start,5),&#39;orig&#39;); %cell array% Origin(i)=3; %South%else% Origin(i)=1; %West %change later from 1 to 4%endend%% Additional Constraints beyond A and Aeqholdlim=0; %set max number of holdsERdelaylim=0; %set max amount of en route delayDelayLim=LM/60;% 10/60; %delay limit for any aircraft in hours
lb = zeros(length(c),1); %lower bound on all variableslb(1:N)= ARRn(start,18);ub = [(ARRn(start+sample-1,18)+DelayLim)\*ones(N,1); ones(N\*R+N\*(N-1)/2,1);holdlim(ones(N,1));ERdelaylim(ones(N,1))]; %upper bound on all variablesoffLimits = (7-OL):7;%Set off limit runwaysfor i = offLimitsub(N+i:R:N+R\*(N-1)+i) = 0;%impose upper limit constraints on off limits runwaysendintcon = [N+1:length(c)]&#39;; %specify which variables are integerH=1.5/60; %holding pattern length in hours
binCo=[-1 1]&#39;; %most common block of coefficients in A matrix
%% Clear Source and Initialize Arraysclear ARR\*
Aeq=zeros(2\*N+R,length(c)); %initialize Aeq matrixA=zeros(2\*N+R\*N\*(N-1),length(c)); %initialize A matrix
beq=[zeros(length(te),1);ones(N,1);zeros(R,1)]; %initialize beqb=[te+DelayLim;-te;zeros(R\*N\*(N-1),1)]; %initialize b
%% Assemble time constraintsAtcons=zeros(N,length(c));Atcons(1:N,1:N)= -diag(ones(N,1)); %assemble t components of tcons%Aeq(1:N,length(c)-2\*N+1:length(c)-N)=-H\*diag(ones(N,1)); %assemble H components of tcons%Aeq(1:N,length(c)-N+1:length(c))=-diag(ones(N,1)); %assemble D components of tconsA(1:N,1:N)=diag(ones(N,1)); %assemble delay limits
for i= 1:N %find additional travel time for change of destinationAtcons(i,N+R\*(i-1)+1:N+R\*i)= (Tdest(Origin(i),:)-Tdest(ActDest(i))); %assemble AT portions of tcons for NSEWAeq(N+i,N+R\*(i-1)+1:N+R\*i)=ones(1,7); %assemble single destination constraints for each A/Cend
%A(N+1:2\*N,1:N)=-diag(ones(N,1)); %assemble minimum arrival timesA(N+1:2\*N,:)=Atcons(1:N,:); %assemble minimum arrival times
%% runway capability constraints%for r=1:R%%end
%% Order Constraint Assembly
MRow=1; %start with first pair of Big M constraint rows (Mcons)for i=1:N %assemble t components of all time interval constraints (tcons)
for k=1:Nif i\&gt;kTco=[T(i,k);T(k,i)];A((2\*N+2\*R\*(MRow-1)+1:2\*N+2\*R\*MRow),i)=repmat(binCo,[R,1]); %assemble t components of MconsA((2\*N+2\*R\*(MRow-1)+1:2\*N+2\*R\*MRow),k)=-repmat(binCo,[R,1]); %assemble t components of MconsA((2\*N+2\*R\*(MRow-1)+1:2\*N+2\*R\*MRow),N+R\*(i-1)+1:N+R\*i)=blkdiag(Tco,Tco,Tco,Tco,Tco,Tco,Tco);A((2\*N+2\*R\*(MRow-1)+1:2\*N+2\*R\*MRow),N+R\*(k-1)+1:N+R\*k)=blkdiag(Tco,Tco,Tco,Tco,Tco,Tco,Tco);b(2\*N+2\*R\*(MRow-1)+1:2\*N+2\*R\*MRow)=repmat([T(i,k);M+T(k,i)],[R,1]); %assemble order constraints in beq A(2\*N+(2\*R\*(MRow-1)+1:2\*R\*MRow),N+N\*R+MRow)=M\*repmat(binCo,[R,1]); MRow=MRow+1; %iterate to next constraint setendendend
%for i=1:R\*N\*(N-1)/2 %Assemble right hand side of Mcons%end


%% Solve MILP
Sched=intlinprog(c,intcon,A,b,Aeq,beq,lb,ub); %solve MILPif isempty(Sched)TotalDelay=inf;elseDiff=Sched(1:N)-te;TotalDelay=sum(Diff(Diff\&gt;0));timespan=ub(1)-lb(1);AveTimespan=(timespan\*(NG-1)+AveTimespan)/NG;end

%% Plot Results%figure;%StatQuo=zeros(1,R);%NewDest=zeros(1,R);%for i=1:7% StatQuo(i)=sum(ActDest==i);% NewDest(i)=sum(Sched(N+i:R:N+N\*(R-1)+i));%end%bar(1:7,[StatQuo&#39;,NewDest&#39;])%ylabel(&#39;Number of Flights&#39;)%xlabel(&#39;LAX1 LAX2 LGB1 LBG2 SNA ONT BUR&#39;)%legend(&#39;Status Quo&#39;, &#39;Delay Optimized&#39;)
%% Construct AP assignment on long term basis
for i=1:7StatQuo(7-OL,LM-2,i)=sum(ActDest==i)+StatQuo(7-OL,LM-2,i);if not(isempty(Sched))NewDest(7-OL,LM-2,i)=sum(Sched(N+i:R:N+N\*(R-1)+i))+NewDest(7-OL,LM-2,i);endend
 |

| LongTermPlot.m (B) |
| --- |
| %% Long term Plotclear;LimitMins=3:10;Delay3Var=zeros(7,length(LimitMins));S=size(Delay3Var); %total number of scenariosNumGroups = 5;AveTimespan=0;sample=6;StatQuo=zeros(7,length(LimitMins),7);NewDest=zeros(7,length(LimitMins),7);figure;hold off;xlim([0 7]);ylim([3 10]);title(sprintf(&#39;Delay for 25 A/C over %d samples w.r.t runway options and delay limits&#39;,NumGroups));zlabel(&#39;Delay (minutes)&#39;)ylabel(&#39;Last Delay Limit (minutes)&#39;)xlabel(&#39;LAX1 LAX2 LGB1 LBG2 SNA ONT BUR&#39;)hold on;for NG = 1:NumGroupsfor OL = 0:6 for LM = LimitMinsLAdelayV2Delay3Var(7-OL,LM-2)= TotalDelay\*60 + Delay3Var(7-OL,LM-2);plot3(7-OL,LM,Delay3Var(7-OL,LM-2),&#39;ro&#39;)endendend%% Surf Plot
figure;ylim([0 7]);xlim([3 10]);surf(3:10,1:7,Delay3Var)title(sprintf(&#39;Delay for %d A/C over %d samples w.r.t runway options and delay limits&#39;,sample,NumGroups));zlabel(&#39;Delay (minutes)&#39;)xlabel(&#39;Last Delay Limit (minutes)&#39;)ylabel(&#39;Active Airports&#39;)figure;ylim([0 7]);xlim([3 10]);surf(3:10,1:7,Delay3Var./(NumGroups\*sample))title(sprintf(&#39;Delay per A/C for %d A/C over %d samples w.r.t runway options and delay limits&#39;,sample,NumGroups));zlabel(&#39;Delay per A/C (minutes)&#39;)xlabel(&#39;Last Delay Limit (minutes)&#39;)ylabel(&#39;Active Airports&#39;)%% Plot Results Sorted by Airport for minimum delay scenario[Y, row]= min(Delay3Var);[YY, col]= min(Y);figure;SQvec=zeros(7,1);NDvec=zeros(7,1);for i=1:7SQvec(i)=StatQuo(row(col),col,i);NDvec(i)=NewDest(row(col),col,i);end
bar(1:7,[SQvec,NDvec])ylabel(&#39;Number of Flights&#39;)xlabel(&#39;LAX1 LAX2 LGB1 LBG2 SNA ONT BUR&#39;)legend(&#39;Status Quo&#39;, &#39;Delay Optimized&#39;)legend(&#39;Status Quo&#39;, &#39;Delay Optimized&#39;)title(&#39;Flights to each runway over all time intervals&#39;)AveTimespan
 |

| DynLAdelay.m (general layout of the dynamic solver portion) (C ) |
| --- |
| . . . . %% Solve Dynamic Programfor k = Tl:-1:Tf %or T:-1:1for r=1:RPosInd=find(te\_ir\&lt;k,te\_ir);[tiLast,idL]=min(te(find(Tstar(r,k+1,:))+Tstar(find(Tstar(r,k+1,:))))); %determine last arrival time for runwayfor i=PosInd % this should run out if all AC have landed.if te\_ir(i,r) \&lt; (tiLast-FAAsep) %only optimize if min operation time is within time horizon%if OpType=1; %arrival vs departure conditions
step\_diff = [te\_ir:(tiLast-FAAsep)]-te(i);TotalDelay=sum(step\_diff(step\_diff\&gt;0)); %cost per time step%determine index among all R and A and indnxt from Tstarind = sub2ind([R,A],r,i);ind\_nxt = idN(1);%principle of optimality[V(ind,k,i), idx] = min([V(ind,k+1,i); c + V(idL)]); %??????? ind\_nxt,k+1,i% else% end endendendend
 |
