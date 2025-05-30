struct Named {
  a: Int;
  b: String;
}

contract BothOptionalAndNon {
    x: Named;
    y: Named?;

    init() {
        self.x = Named{a: 5, b: "x"};
        self.y = null;
    }
}