struct Chain1 { x: Int; }
struct Chain2 { prev: Chain1; y: Bool; }
struct Chain3 { prev: Chain2; z: String; }

contract TestContract {
    node: Chain3;

    init() {
        self.node = Chain3{
            prev: Chain2{
                prev: Chain1{x:42},
                y:true
            },
            z: "chain"
        };
    }

    receive() {}
}