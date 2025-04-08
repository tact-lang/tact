struct BigChain1 {x:Int;}
struct BigChain2 {s:BigChain1;}
struct BigChain3 {s:BigChain2;}
struct BigChain4 {s:BigChain3;}
struct BigChain5 {s:BigChain4;}
struct BigChain6 {s:BigChain5;}
struct BigChain7 {s:BigChain6;}

contract Chain7 {
    data: BigChain7;
    init() {
        self.data = BigChain7{s:BigChain6{s:BigChain5{s:BigChain4{s:BigChain3{s:BigChain2{s:BigChain1{x:77}}}}}}};
    }
}