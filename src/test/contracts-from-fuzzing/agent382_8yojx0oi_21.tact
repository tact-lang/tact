struct TrailingOptionals {
    a: Int;
    b: Int?; 
    c: Int?; 
    d: Int?; 
}

contract TrailingOptionalsContract {
    data: TrailingOptionals;

    init() {
        self.data = TrailingOptionals{
            a: 1,
            b: null,
            c: 2,
            d: null
        };
    }
}