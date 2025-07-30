struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    s: String?;
}

contract OptionalFields {
    state: WithOptionals;
    init() {
        self.state = WithOptionals{
            foo:null, 
            bar:true,
            s:"test"
        };
    }
    receive() {}
}