struct Named {
    first: String;
    last: String;
}

contract AnotherNested {
    person: Named;

    init() {
        self.person = Named{ first:"Joe", last:"Doe" };
    }
}
