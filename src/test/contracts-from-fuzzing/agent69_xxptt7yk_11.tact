contract TryCatchTest {
    receive() {
         // This test uses try...catch to catch a thrown exit code
         try {
             throw(1042);
         } catch (err) {
             dump(err); // Expected to dump 1042
         }
    }
}
