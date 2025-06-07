struct SubInner { b: Bool; i: Int }
struct Inner { x: Int; s: SubInner }

contract TestContract {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{
            x:123,
            s:SubInner{
                b:true,
                i:-999
            }
        };
    }
}