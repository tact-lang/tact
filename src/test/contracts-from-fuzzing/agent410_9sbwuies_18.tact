struct Names {
    first: String; 
    middle: String;
    last: String;
    nickname: String?;
}

contract TestContract {
    person: Names;

    init() {
        self.person = Names{
            first: "John",
            middle: "F.",
            last: "Kennedy",
            nickname: null
        };
    }
}
