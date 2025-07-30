struct OptNested1 { val: Int? }
struct OptNested2 { nested: OptNested1? }
struct OptNested3 { nested: OptNested2? }

contract OptNestedContract {
    data: OptNested3;

    init() {
        self.data = OptNested3{
            nested: OptNested2{
                nested: OptNested1{
                    val: null
                }
            }
        };
    }

    receive() {}
}