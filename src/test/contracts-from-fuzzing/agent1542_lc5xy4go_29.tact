struct Innermost { a: Int }
struct Container {
  inn1: Innermost; inn2: Innermost; inn3: Innermost;
}

contract ComposeAssignments {
  field: Container;

  init(){
    let c = Container{
      inn1: Innermost{a:1}, inn2: Innermost{a:2}, inn3: Innermost{a:3}
    };
    self.field = c;
  }
}