// fails: we're redefining a function from fun-shadow-1
// must have only one error

import "./fun-shadow-1";
import "./fun-shadow-3";

fun foo() {}
