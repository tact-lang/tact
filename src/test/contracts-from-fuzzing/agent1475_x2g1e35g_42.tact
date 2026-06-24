// Minimal nested optional struct, explicitly assigned null inside struct
struct S {
    opt: Bool?;
}

contract OptAssignNull {
    data: S;

    init() {
        self.data = S{
            opt: null,
        };
    }
}