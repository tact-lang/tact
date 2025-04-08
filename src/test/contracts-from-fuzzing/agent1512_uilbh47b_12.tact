struct Info {
    owner: Address?;
    flag: Bool;
}

contract TestContract {
    data: Info;

    init() {
        self.data = Info{
            owner: null,
            flag: false
        };
    }
}