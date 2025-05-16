struct Inner1 { v: Int }
struct Inner2 { v1: Inner1; v2: Int }
struct Inner3 { v2: Inner2; more: Int }

contract MultipleNestedOptional {
    data: Inner3?;

    init() {
        self.data = null;
    }
}