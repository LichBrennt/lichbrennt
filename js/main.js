window.addEventListener("scroll", ()=>{
    var headerNav = document.querySelector('.navbar')
    headerNav.classList.toggle('sticky', window.scrollY>0)
})