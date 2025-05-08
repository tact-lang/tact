// Deep nested optional string inside several structs
struct Lvl3 { msg: String?; }
struct Lvl2 { nested: Lvl3?; }
struct Lvl1 { nested: Lvl2?; extra: Bool; }

contract TestContract {
    field: Lvl1;

    init() {
        self.field = Lvl1{
            nested: Lvl2{
                nested: Lvl3{
                    msg: "hello",
                },
            },
            extra: true,
        };
    }
}
