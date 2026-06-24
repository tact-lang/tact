struct RecBase { x: Int; }
struct RecWrap1 { rb: RecBase; }
struct RecWrap2 { rw: RecWrap1; }
struct RecWrap3 { rw2: RecWrap2; }
struct RecWrap4 { rw3: RecWrap3; }

struct BigWrapper {
    item: RecWrap4;
    optInt: Int?;
    optBool: Bool?;
    addr: Address;
    name: String;
}

contract TestContract {
    val: BigWrapper;

    init() {
        self.val = BigWrapper{
            item: RecWrap4{
                rw3: RecWrap3{
                    rw2: RecWrap2{
                        rw: RecWrap1{
                            rb: RecBase{
                                x: 42
                            }
                        }
                    }
                }
            },
            optInt: null,
            optBool: null,
            addr: myAddress(),
            name: "Edge"
        };
    }
}