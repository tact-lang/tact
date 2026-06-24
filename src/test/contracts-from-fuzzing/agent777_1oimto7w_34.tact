struct InnerOptStr {
    optField: String?;
}

struct OuterOptStr {
    nested: InnerOptStr?;
}

contract OptionalInOptional {
    data: OuterOptStr;

    init() {
        self.data = OuterOptStr{
            nested: InnerOptStr {
               optField: null 
            }
        };
    }
}