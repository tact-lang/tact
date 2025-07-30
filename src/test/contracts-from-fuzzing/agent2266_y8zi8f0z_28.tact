// nested optional in struct field's optional (allowed)
struct Inner { msg: String }

struct Container { x: Inner?; note: String }

contract Test {
    c: Container;

    init() {
        self.c = Container{
            x: null,
            note: "done"
        };
    }
}
