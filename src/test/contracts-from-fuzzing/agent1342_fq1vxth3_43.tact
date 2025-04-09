// nested optional struct with optionals
struct Sub {
    x:Int?;
    y:Bool?;
}

struct Container {
    s: Sub?;
    msg: String;
}

contract NullableStructInOptional {
    field: Container;

    init() {
        self.field = Container{
            s: Sub{
                x: 11,
                y: true
            },
            msg: "hi"
        };
    }
}