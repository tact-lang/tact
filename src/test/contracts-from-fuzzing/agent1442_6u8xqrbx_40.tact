// fuzz: persistent state with nested struct chain, last element uses serialization
struct Small { n: Int as uint4; }
struct Mid { child: Small; flag: Bool; }
struct Big { mid: Mid; msg: String; }

contract TestContract {
    data: Big;
    init() {
        self.data = Big{mid:Mid{child:Small{n:7},flag:true},msg:"hey"};
    }
}