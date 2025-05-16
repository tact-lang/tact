struct EmbeddedOptional {
  inside: Int?;
  flag: Bool;
}

contract DeepInit {
    data: EmbeddedOptional;

    init() {
        self.data = EmbeddedOptional{ inside: null, flag: true };
    }
}