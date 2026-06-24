// deeply nested optional nullable message struct
message(100) InnerMsg {}

struct WrapStruct {
    msg: InnerMsg?;
}

contract TestContract {
    wrapped: WrapStruct?;

    init() {
        self.wrapped = null;
    }
}