/* Snippet 8: Using initOf in a getter function to retrieve own code cell */

contract GetterTest {
    init() {}
    
    // Getter function that returns a contract's own code as a Cell
    get fun getSelfCode() : Cell {
         return (initOf GetterTest()).code;
    }
}
