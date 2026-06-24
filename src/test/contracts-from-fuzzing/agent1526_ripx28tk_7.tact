struct LargeOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
}

contract LargeOptionalsContract {
    data: LargeOptionals;

    init() {
        self.data = LargeOptionals{
            a:null, b:1, c:null, d:3, e:null,
            f:5, g:null, h:7, i:null, j:9,
        };
    }
}