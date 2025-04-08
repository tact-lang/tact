struct HighlyNested {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Container1 {
    f: HighlyNested;
}
struct Container2 {
    f: Container1;
}
struct Container3 {
    f: Container2;
}
struct Container4 {
    f: Container3;
}
struct Container5 {
    f: Container4;
}
struct Container6 {
    f: Container5;
}

contract DeepChain {
    val: Container6;

    init() {
        self.val = Container6{
            f: Container5{
                f: Container4{
                    f: Container3{
                        f: Container2{
                            f: Container1{
                                f: HighlyNested{ a: 1, b: false, c: null }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.val;
    }
}