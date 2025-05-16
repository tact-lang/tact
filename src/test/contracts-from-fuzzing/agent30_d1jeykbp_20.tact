contract TestTryCatchNested {
    receive() {
         try {
              try {
                 throw(101);
              } catch (innerErr) {
                 dump(innerErr); // should dump 101
              }
         } catch (outerErr) {
              dump(outerErr); // not expected to happen
         }
    }
}
