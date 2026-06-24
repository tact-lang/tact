struct BigChain {
    nx1: BigChain2;
}

struct BigChain2 {
    nx2: BigChain3;
}

struct BigChain3 {
    nx3: BigChain4;
}

struct BigChain4 {
    nx4: BigChain5;
}

struct BigChain5 {
    nx5: BigChain6;
}

struct BigChain6 {
    leaf: Int;
}

contract NestedBigChain {
    root: BigChain;

    init() {
        self.root = BigChain {
            nx1: BigChain2 {
                nx2: BigChain3 {
                    nx3: BigChain4 {
                        nx4: BigChain5 {
                            nx5: BigChain6 {
                                leaf: 123
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.root.nx1.nx2.nx3.nx4.nx5.leaf;
    }
}