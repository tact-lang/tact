struct Chain1 { next: Chain2; }
struct Chain2 { next: Chain3; }
struct Chain3 { next: Chain4; }
struct Chain4 { next: Chain5; }
struct Chain5 { next: Chain6; }
struct Chain6 { next: Chain7; }
struct Chain7 { value: Int; }
contract DeepChain {
    start: Chain1 = Chain1{ next: Chain2{ next: Chain3{ next: Chain4{ next: Chain5{ next: Chain6{ next: Chain7{value:0}}}}}}};
}