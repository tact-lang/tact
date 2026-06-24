// mix of optional nested struct and nested optional struct
struct Basic { a: Int; }
struct OptStruct { s: Basic?; }
struct StructOpt { o: OptStruct; }

contract CrossOptional {
    data: StructOpt;
    init() {
        self.data = StructOpt{ o: OptStruct{ s: null } };
    }
}