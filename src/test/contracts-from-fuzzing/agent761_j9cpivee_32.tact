struct DeepOptA { f: Int? }
struct DeepOptB { g: DeepOptA? }

contract NestedManyOptionals {
  foo: DeepOptB?;

  init() {
    self.foo = DeepOptB{ g: DeepOptA{ f: null } };
  }
}