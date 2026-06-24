contract OptionalTest {
    receive() {
         let maybe: Int? = 10;
         if (maybe != null) {
             dump(maybe!!);
         } else {
             dump(0);
         }
    }
}
