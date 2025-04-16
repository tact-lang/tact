struct Slim {
  v: Int;
}

struct SlimOpt {
  s: Slim?;
}

struct SlimOptOpt {
  so: SlimOpt?;
}

contract LayeredOptionals {
  data: SlimOptOpt;

  init() {
    self.data = SlimOptOpt{
      so: SlimOpt{
        s: Slim{ v: 777 }
      }
    };
  }
}
