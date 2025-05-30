contract NestedTryTest {
    fun nestedTry(b: Bool): Int {
         try {
              if (b) {
                  throw(50);
              }
              return 100;
         } catch (inner) {
             try {
                  if (!b) {
                      throw(30);
                  }
                  return inner;
             } catch (inner2) {
                  return inner2;
             }
         }
    }
}
