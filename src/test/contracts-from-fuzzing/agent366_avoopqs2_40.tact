struct Embeds {
 x: Int;
 y: Bool?;
}

struct Container {
 val: Embeds?;
}

contract NullableEmbed {
 stored: Container;
 init() {
  self.stored = Container{
    val: null
  };
 }
}