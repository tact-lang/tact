struct DeeplyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct OuterOptHolder {
    x: Int;
    inner: DeeplyOptional;
}

contract ManyOptionals {
    data: OuterOptHolder;

    init() {
        self.data = OuterOptHolder{
            x: 99,
            inner: DeeplyOptional{
                a: null,
                b: null,
                c: null
            }
        };
    }
}