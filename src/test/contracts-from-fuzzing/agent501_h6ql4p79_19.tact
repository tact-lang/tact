struct ManyNestedStructs {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrapper1 { inner: ManyNestedStructs }
struct Wrapper2 { inner: Wrapper1 }
struct Wrapper3 { inner: Wrapper2 }

contract ManyLevels {
    data: Wrapper3;

    init() {
        self.data = Wrapper3{
            inner: Wrapper2{
                inner: Wrapper1{
                    inner: ManyNestedStructs{
                        a:42, b:true, c:"hey"
                    }
                }
            }
        };
    }
}