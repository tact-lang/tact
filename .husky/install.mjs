// Makes all husky runs silent when it shouldn't have run
// And non-silent otherwise (direct installation of dependencies inside Tact repo)
//
// Taken from:
// https://typicode.github.io/husky/how-to.html#ci-server-and-docker

const husky = (await import("husky")).default;
console.log(husky());
