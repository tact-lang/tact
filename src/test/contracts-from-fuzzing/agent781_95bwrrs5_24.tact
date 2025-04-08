struct Nest1 {
  n2: Nest2;
}
struct Nest2 {
  n3: Nest3;
}
struct Nest3 {
  n4: Nest4;
}
struct Nest4 {
  n5: Nest5;
}
struct Nest5 {
  value: Int;
}

contract TestContract {
    deep: Nest1;

    init() {
        self.deep = Nest1{
            n2: Nest2{
                n3: Nest3{
                    n4: Nest4{
                        n5: Nest5{
                            value: 42
                        }
                    }
                }
            }
        };
    }
}