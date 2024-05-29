package com.contactmanager;

public class Contact {
    private String nom;
    private String numeroTelephone;
    private String ville;
    private String profession;

    public Contact(String nom, String numeroTelephone, String ville, String profession) {
        this.nom = nom;
        this.numeroTelephone = numeroTelephone;
        this.ville = ville;
        this.profession = profession;
    }

    // Getters and Setters
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNumeroTelephone() {
        return numeroTelephone;
    }

    public void setNumeroTelephone(String numeroTelephone) {
        this.numeroTelephone = numeroTelephone;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }
}
