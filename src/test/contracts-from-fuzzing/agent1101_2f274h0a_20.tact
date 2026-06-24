struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract MultipleOptions {
    val: HasManyOptionals;

    init() {
        self.val = HasManyOptionals{
            a:1, b:true, c:null, d:null, e:false
        };
    }
}