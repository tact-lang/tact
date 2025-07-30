struct HasString {
    foo: String;
}

contract LongStringInit {
    data: HasString;

    init() {
        self.data = HasString{
            foo: "this is a quite long string just to test persistent storage capacity and behavior"
        };
    }
}
