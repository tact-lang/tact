struct Inner { f1: Int; f2: Bool; f3: String; }

struct Outer { nested: Inner; count: Int; flag: Bool; }

contract Nesty {
    store: Outer;
    init() {
        self.store = Outer{
            nested: Inner{
                f1: 5,
                f2: true,
                f3: "yo"
            },
            count: 1,
            flag: false
        };
    }
}