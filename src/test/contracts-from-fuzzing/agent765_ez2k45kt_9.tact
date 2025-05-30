struct HasOptionals {
    first: Int?;
    second: Int?;
    third: Int?;
    fourth: Int?;
    fifth: Int?;
}

contract TestContract {
    data: HasOptionals;

    init() {
        self.data = HasOptionals{
            first:1, second:2, third:3, fourth:4, fifth:5 };
    }
}