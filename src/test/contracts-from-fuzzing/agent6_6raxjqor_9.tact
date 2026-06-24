struct OptStruct {
    a: Int;
    b: Int?;
}

contract OptionalContract {
    receive() {
         let s: OptStruct = OptStruct { a: 20, b: null };
         if (s.b != null) {
             dump(s.b!!);
         } else {
             dump(0);
         }
    }
}
