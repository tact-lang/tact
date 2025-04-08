struct C { val: Int; }
struct B { optC: C?; }
struct A { optB: B?; }
struct Root { optA: A?; }

contract DeepOptionFields {
    state: Root;

    init() {
        self.state = Root{
            optA: A{
                optB: B{
                    optC: C{ val: 42 }
                }
            }
        };
    }

    receive() {
        if (self.state.optA != null && self.state.optA!!.optB != null && self.state.optA!!.optB!!.optC != null) {
            let _ = self.state.optA!!.optB!!.optC!!.val;
        }
    }
}