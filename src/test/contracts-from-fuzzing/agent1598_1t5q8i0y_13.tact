struct Chain1 { v: Int }
struct Chain2 { v: Chain1 }
struct Chain3 { v: Chain2 }
struct Chain4 { v: Chain3 }
struct Chain5 { v: Chain4 }

contract FiveDeep {
    x: Chain5 = Chain5{v: Chain4{v: Chain3{v: Chain2{v: Chain1{v: 123}}}}};

    init() {
        self.x = Chain5{v: Chain4{v: Chain3{v: Chain2{v: Chain1{v: 456}}}}};
    }
}