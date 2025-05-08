struct OptionalWrapped {
    wrap: CoreData?;
}

struct CoreData {
    a: Int;
    b: Bool;
    c: String;
}

contract WrappedOptionTest {
    val: OptionalWrapped;

    init() {
        self.val = OptionalWrapped{
            wrap: CoreData{
                a:7,
                b:false,
                c:"z"
            }
        };
    }
}
