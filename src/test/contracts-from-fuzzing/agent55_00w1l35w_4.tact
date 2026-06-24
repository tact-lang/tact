/* Snippet 1: Valid usage of wildcard in receiver parameter
   Using a message type UniverseCalls, following the documentation 
*/

message UniverseCalls {}

contract TestValidWildcardParameter {
    receive(_: UniverseCalls) {}
}
