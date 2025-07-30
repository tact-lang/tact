struct DeeplyNested1 { f: Int; }
struct DeeplyNested2 { inner: DeeplyNested1; }
struct DeeplyNested3 { inner: DeeplyNested2; }
struct DeeplyNested4 { inner: DeeplyNested3; }

contract TestContract {
    nested: DeeplyNested4;

    init() {
        self.nested = DeeplyNested4{
            inner: DeeplyNested3{
                inner: DeeplyNested2{
                    inner: DeeplyNested1{ f: 123 }
                }
            }
        };
    }
}