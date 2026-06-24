/* Snippet 9 (Revised): Testing wildcard in foreach loop's pattern using correct map syntax
   Using a wildcard to discard the value while iterating over a map. This should compile, 
   assuming the wildcard is allowed in foreach patterns for discarding entries as per the docs.
*/

contract TestForEachWildcard {
    // Use angle bracket syntax for map type
    mapping: map<Int, Int> = emptyMap();
    
    receive() {
        // Initialize map with one element
        self.mapping.set(1, 100);

        foreach (key, _ in self.mapping) {
            dump(key);
        }
    }
}
