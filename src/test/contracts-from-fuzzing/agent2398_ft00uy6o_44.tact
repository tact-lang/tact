struct HasOptionalBuilder {
    payload: Builder?;
    comment: String;
}

contract TestContract {
    s: HasOptionalBuilder;

    init() {
        self.s = HasOptionalBuilder{
            payload: null,
            comment: "hi"
        };
    }
}