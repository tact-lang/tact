struct Choice {
    label: String;
    data: Int?;
}

struct Result {
    ok: Choice?;
    err: Choice?;
}

contract OptionalNestedOptionals {
    result: Result;
    init() {
        self.result = Result{
            ok: Choice{ label: "done", data: null },
            err: null
        };
    }
}