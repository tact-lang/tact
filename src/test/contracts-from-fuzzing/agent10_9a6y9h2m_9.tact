contract BoolTest {
    const FLAG: Bool = true;

    receive() {
         if (self.FLAG) {
             // When FLAG is true, return 1
             1;
         } else {
             0;
         }
    }
}
