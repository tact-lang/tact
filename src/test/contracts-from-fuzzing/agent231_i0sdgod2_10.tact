struct HasManyOptions {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: String?; l: String?; m: String?; n: String?; o: String?;
}

contract ManyNulls {
    data: HasManyOptions;

    init() {
        self.data = HasManyOptions{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null,
            k:null, l:null, m:null, n:null, o:null,
        };
    }
}