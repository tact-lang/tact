struct Ok {
    x: Int;
    s: Slice as remaining;
}

contract TestContract {
    ok: Ok;

    init() {
        self.ok = Ok{
            x: 5,
            s: "hello".asComment().asSlice(),
        };
    }
}