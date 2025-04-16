struct Combined {
    n: Int = 5;
    flag: Bool;
    text: String?;
}

contract CombinedContract {
    data: Combined;

    init() {
        self.data = Combined{
            flag: false,
            text: null,
        };
    }
}