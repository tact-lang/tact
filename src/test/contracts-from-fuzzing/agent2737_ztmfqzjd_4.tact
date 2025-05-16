struct WithManyOptionals {
  a: Int?; b: Bool?; c: String?; d: Address?;
  e: Int?; f: Bool?; g: String?; h: Address?;
}

contract ManyOptionalFields {
    data: WithManyOptionals;

    init() {
        self.data = WithManyOptionals{
            a:null, b:null, c:null, d:null,
            e:5, f:true, g:"abc", h:myAddress()
        };
    }
}