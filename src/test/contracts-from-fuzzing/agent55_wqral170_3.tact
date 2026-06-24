struct InnerMost { val: Int; }
struct Inner { nested: InnerMost; optVal: Bool?; }
struct Middle { nested: Inner; arr: map<Int, Int>; }
struct Outer { nested: Middle; optStruct: Inner?; }

contract DeepNest {
    deep: Outer;
    init() {
        self.deep = Outer{
            nested: Middle{
                nested: Inner{
                    nested: InnerMost{ val: 42 },
                    optVal: null
                },
                arr: emptyMap()
            },
            optStruct: null
        };
    }
    receive() {}
}